def validate_sizes(image, restr):
        if image.width < restr['min_width'] or image.width > restr['max_width']:
            return False
        if image.height < restr['min_height'] or image.height > restr['max_height']:
            return False
        return True