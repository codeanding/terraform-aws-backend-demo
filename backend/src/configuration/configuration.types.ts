export interface DatabasesConfig {
  main: { url: string };
}

export interface HostConfig {
  host: string;
  port: number;
}

export interface AWSConfig {
  services: {
    defaultRegion: string;
  };
  credentials: {
    accessKeyId: string;
    secretAccessKey: string;
  };
}

export interface ConfigurationVariables {
  applicationName: string;
  db: DatabasesConfig;
  environment: string;
  aws: AWSConfig;
  http: HostConfig;
}
