from django.db.models import BooleanField

class UniqueBooleanField(BooleanField):

       def pre_save(self, model_instance, add):
        objects = model_instance.__class__.objects
        if getattr(model_instance, self.attname):
            objects.update(**{self.attname: False})
        elif not objects.exclude(id=model_instance.id)\
                        .filter(**{self.attname: True}):
            return True
        return getattr(model_instance, self.attname)
