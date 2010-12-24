# OCCI

[Ruby](http://www.ruby-lang.org/) bindings to [OpenNebula's](http://opennebula.org) [Open Cloud Computing Interface (OCCI)](http://www.opennebula.org/documentation:rel2.0:occidd).

## Usage

### Bundler

    gem "occi"

### Examples

See the examples section in the [wiki](http://github.com/retr0h/occi/wiki).

## Testing

MiniTest will run the tests in a random order.  When rebuilding the fixtures, the entity
tests depend on the pool tests having already been run.  Since the fixtures change infrequently,
this should be acceptable.

Tests can run offline thanks to [VCR](https://github.com/myronmarston/vcr).

    $ export ONE_USER=$user
    $ export ONE_PASSWORD=$password

    $ bundle exec rake

## TODO

* Should we raise when we do not have expected HTTP code or body?
