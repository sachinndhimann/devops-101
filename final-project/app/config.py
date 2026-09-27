"""
Configuration via environment variables.
This is the ONE place the app reads its config from.
Never hardcode DATABASE_URL, REDIS_URL, etc. anywhere else in the codebase.
"""
import os


class Settings:
    environment: str = os.getenv("ENVIRONMENT", "development")
    log_level: str = os.getenv("LOG_LEVEL", "INFO")
    database_url: str = os.getenv(
        "DATABASE_URL", "postgresql://postgres:postgres@db:5432/appdb"
    )
    redis_url: str = os.getenv("REDIS_URL", "redis://redis:6379/0")
    app_version: str = os.getenv("APP_VERSION", "0.1.0")


settings = Settings()
