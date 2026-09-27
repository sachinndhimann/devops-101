FROM alpine:3.20
RUN apk add --no-cache curl
RUN echo "layer 3" > /tmp/marker
COPY src/app.py /app.py
CMD ["cat", "/app.py"]
