FROM postgres:latest

ENV POSTGRES_USER=catalyst_test_user
ENV POSTGRES_PASSWORD=catalyst_test_password
ENV POSTGRES_DB=catalyst_test_database

EXPOSE 5432
