import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateCardDto } from './dtos/create-card.dto';

@Injectable()
export class CardsService {
  constructor(private prisma: PrismaService) {}

  async create(data: CreateCardDto) {
    return this.prisma.card.create({ data });
  }

  async findAll() {
    return this.prisma.card.findMany({ include: { owner: true } });
  }

  async findOne(id: string) {
    return this.prisma.card.findUnique({
      where: { id },
      include: { owner: true },
    });
  }
}
