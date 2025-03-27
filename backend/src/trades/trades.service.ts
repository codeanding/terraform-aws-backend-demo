import { Injectable, NotFoundException } from '@nestjs/common';
import { TradeStatus } from '@prisma/client';
import { PrismaService } from '../prisma/prisma.service';
import { CreateTradeDto } from './dtos/create-trade.dto';

@Injectable()
export class TradesService {
  constructor(private prisma: PrismaService) {}

  async create(dto: CreateTradeDto) {
    return this.prisma.trade.create({
      data: {
        ...dto,
        status: TradeStatus.PENDING,
      },
    });
  }

  async findAll() {
    return this.prisma.trade.findMany({
      include: {
        offeredBy: true,
        requestedBy: true,
        cardOffered: true,
        cardRequested: true,
      },
    });
  }

  async updateStatus(id: string, status: TradeStatus) {
    const trade = await this.prisma.trade.findUnique({ where: { id } });
    if (!trade) throw new NotFoundException('Trade not found');

    return this.prisma.trade.update({
      where: { id },
      data: { status },
    });
  }
}
