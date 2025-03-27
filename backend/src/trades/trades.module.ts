import { Module } from '@nestjs/common';
import { ConfigurationModule } from 'src/configuration/configuration.module';
import { PrismaModule } from 'src/prisma/prisma.module';
import { PrismaService } from 'src/prisma/prisma.service';
import { TradesController } from './trades.controller';
import { TradesService } from './trades.service';

@Module({
  imports: [ConfigurationModule, PrismaModule],
  controllers: [TradesController],
  providers: [PrismaService, TradesService],
})
export class TradesModule {}
