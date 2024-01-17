# Django Boilerplate

## Requirements

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [GNU Make](https://www.gnu.org/software/make/)

## Setup

1. Create a `.env` file in the project root and set your Django secret key:

    ```
   POSTGRES_DB=postgres
   POSTGRES_USER=postgres
   POSTGRES_PASSWORD=postgres
   POSTGRES_PORT=5432
   POSTGRES_HOST=postgres
   DJANGO_PORT=8000
   
   DJANGO_SECRET_KEY=
    ```

2. Build and run the Docker containers using Makefile commands:

    ```bash
   make app
    ```

3. Open your browser and navigate to [http://localhost:8000](http://localhost:8000) to access your Django app.

## Implemented Makefile Commands

* `make app` - up application and database/infrastructure
* `make app-logs` - follow the logs in app container
* `make app-down` - down application and all infrastructure
* `make storages` - up only storages. you should run your application locally for debugging/developing purposes
* `make storages-logs` - logs in storages containers
  `make storages-down` - down all infrastructure

  #### Django Specific

* `make migrations`
* `make migrate`
* `make createsuperuser`
* `make collectstatic`

## Docker Compose Services

- `web`: Django application server.
- `postgree`: PostgreSQL database server.



## Additional

If running "make storages" (docker is for database only), update the DATABASES HOST to:

```
"HOST": "localhost"
```

Happy coding!
