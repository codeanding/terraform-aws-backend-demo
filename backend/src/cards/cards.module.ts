import { Module } from '@nestjs/common';
import { ConfigurationModule } from 'src/configuration/configuration.module';
import { PrismaModule } from 'src/prisma/prisma.module';
import { PrismaService } from 'src/prisma/prisma.service';
import { CardsController } from './cards.controller';
import { CardsService } from './cards.service';

@Module({
  imports: [ConfigurationModule, PrismaModule],
  controllers: [CardsController],
  providers: [PrismaService, CardsService],
})
export class CardsModule {}
