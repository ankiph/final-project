function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    baseXpeUrl: 'https://xpepapi.xpe.staging-traveloka.com/en-id',
    baseTrpUrl: 'https://api.trp.staging-traveloka.com/en-id',
    stagingXpeUrl: 'https://www-rc.web.tvlk.dev/api',
    prodXpeUrl:  'https://api.xpe.traveloka.com',
    stagingUrl: 'https://api-shared-stg.test.tvlk.cloud',
    origin: 'https://www-rc.web.tvlk.dev',
    baseXpePath: '/v2/experience/',
    baseTrpPath: '/v2/trip/',
    config_experienceId: '5316711385835'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}