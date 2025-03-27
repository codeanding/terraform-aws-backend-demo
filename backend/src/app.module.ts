import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CardsModule } from './cards/cards.module';
import { ConfigurationModule } from './configuration/configuration.module';
import { PrismaModule } from './prisma/prisma.module';
import { TradesModule } from './trades/trades.module';
import { UsersModule } from './users/users.module';

@Module({
  imports: [
    ConfigurationModule,
    PrismaModule,
    UsersModule,
    CardsModule,
    TradesModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
