from django.db import models


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')

    # return string format of field
    def __str__(self):
        return self.question_text


class Choice(models.Model):
    # TOCHECK: https://docs.djangoproject.com/en/2.2/intro/tutorial02/
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

    def __str__(self):
        return self.choice_text
