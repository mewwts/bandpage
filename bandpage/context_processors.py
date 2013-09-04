import config

def page_info(request):
        return {
            'band_name': config.BAND_NAME,
            'booking_name': config.BOOKING_NAME,
            'booking_mail': config.BOOKING_MAIL,
            'booking_phone': config.BOOKING_PHONE,
            'pr_name': config.PR_NAME,
            'pr_mail': config.PR_MAIL,
            'pr_phone': config.PR_PHONE,
            'twitter_url': config.TWITTER_URL,
            'facebook_url': config.FACEBOOK_URL
        }