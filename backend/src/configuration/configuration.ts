import { ConfigurationVariables } from './configuration.types';

export default function configuration(): ConfigurationVariables {
  const appEnvironment = process.env.API_ENV || 'development';
  const appName = process.env.API_APP_NAME || 'trading-card-api';
  const appPort = Number(process.env.API_PORT) || 3000;

  return {
    applicationName: appName,
    aws: {
      credentials: {
        accessKeyId: process.env.API_AWS_ACCESS_KEY!,
        secretAccessKey: process.env.API_AWS_SECRET_KEY!,
      },
      services: {
        defaultRegion: 'us-west-2',
      },
    },
    http: {
      host: 'localhost',
      port: appPort,
    },
    environment: appEnvironment,
    db: {
      main: {
        url: process.env.API_DB_URL!,
      },
    },
  };
}
