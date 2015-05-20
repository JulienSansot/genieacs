NRP = require 'node-redis-pubsub'
config = require './config'

nrp = null;

if config.get('REDIS_PUBSUB') == true
	nrp = new NRP({
		port: config.get('REDIS_PORT'),
		host: config.get('REDIS_HOST'),
		scope: config.get('REDIS_PUBSUB_SCOPE')
	})

exports.emit = (channel, obj) ->
	if nrp != null
  	nrp.emit(channel, obj);