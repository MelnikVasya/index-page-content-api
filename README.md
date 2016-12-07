# Setting up dev environment

## Initial setup

1. Git clone the repository with SSH

        $ git clone git@github.com:petadam/index-page-content-api.git

2. Ensure you RVM and the ruby version mentioned .ruby-version file installed

3. Run `bundle install`

4. Ensure you have Postgresql V9.5 and above installed

5. Run `rake db:setup`

5. Run a db migrate in case there are additional migrations not reflected

        rake db:migrate

9. Prepare for tests

        rake db:test:prepare

10. Run tests

        rake test

## Usages

1. Get list of indices

        & curl http://localhost:3000/api/v1/indices

2. Create new index

        $ curl --data-urlencode 'url=http://example.com/' http://localhost:3000/api/v1/indices

## Contributing

Open tickets or send pull requests with improvements. Please write good commit messages or your pull requests will be closed.
