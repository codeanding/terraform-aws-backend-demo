import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { ConfigurationVariables } from './configuration.types';

@Injectable()
export class ConfigurationService {
  constructor(private configService: ConfigService<ConfigurationVariables>) {}

  httpPort(): number {
    return this.configService.get('http.port', { infer: true }) || 3004;
  }

  dbMainUrl(): string {
    return this.configService.get('db.main.url', { infer: true }) || '';
  }

  awsConfig() {
    return this.configService.get('aws', { infer: true });
  }

  environment(): string {
    return (
      this.configService.get('environment', { infer: true }) || 'development'
    );
  }

  applicationName(): string {
    return (
      this.configService.get('applicationName', { infer: true }) ||
      'trading-card-api'
    );
  }
}
