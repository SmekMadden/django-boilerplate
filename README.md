# Django Boilerplate

This is a boilerplate for Django projects that utilizes Docker Compose, a Makefile, and PostgreSQL.

## Requirements

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [GNU Make](https://www.gnu.org/software/make/)

## Setup

1. Clone this repository:

    ```bash
    git clone https://github.com/SmekMadden/django-boilerplate.git
    ```
2. Install all required packages in `Requirements` section.


3. Create a `.env` file in the project root and set your Django secret key:

    ```
   POSTGRES_DB=postgres
   POSTGRES_USER=postgres
   POSTGRES_PASSWORD=postgres123
   POSTGRES_PORT=5432
   POSTGRES_HOST=postgres
   DJANGO_PORT=8000
    ```

4. Build and run the Docker containers using Makefile commands:

    ```bash
   make app
    ```

5. Apply database migrations:

    ```bash
    make migrate
    ```

5. Create a superuser (admin) account:

    ```bash
    make createsuperuser
    ```

6. Open your browser and navigate to [http://localhost:8000](http://localhost:8000) to access your Django app.

### Implemented Makefile Commands

* `make app` - up application and database/infrastructure
* `make app-logs` - follow the logs in app container
* `make app-down` - down application and all infrastructure
* `make storages` - up only storages. you should run your application locally for debugging/developing purposes
* `make storages-logs` - logs in storages containers
* `make storages-down` - down all infrastructure

## Docker Compose Services

- `web`: Django application server.
- `postgree`: PostgreSQL database server.

## Customization

Feel free to customize the Django project settings, Docker Compose configuration, and the Makefile according to your project requirements.

Happy coding!
