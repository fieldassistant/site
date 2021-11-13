FROM certbot/certbot

COPY certbot.sh .

ENTRYPOINT ["/bin/sh", "certbot.sh"]
CMD ["renew"]
