from django.db.models import BooleanField
from django.db.models import ImageField
from django.core.exceptions import ValidationError

class UniqueBooleanField(BooleanField):

       def pre_save(self, model_instance, add):
        objects = model_instance.__class__.objects
        if getattr(model_instance, self.attname):
            objects.update(**{self.attname: False})
        elif not objects.exclude(id=model_instance.id)\
                        .filter(**{self.attname: True}):
            return True
        return getattr(model_instance, self.attname)

        def __unicode__(self):
            return u'Boolean field that allows only one to be true'

            

           
