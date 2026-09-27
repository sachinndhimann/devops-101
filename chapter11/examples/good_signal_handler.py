import signal
import sys
import time

def handle_sigterm(signum, frame):
    print("SIGTERM received, shutting down cleanly")
    sys.exit(0)

signal.signal(signal.SIGTERM, handle_sigterm)
print("good handler starting, will exit fast on SIGTERM")
while True:
    time.sleep(1)
