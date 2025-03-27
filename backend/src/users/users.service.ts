import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateUserDto } from './dtos/create-user.dto';

@Injectable()
export class UsersService {
  constructor(private prisma: PrismaService) {}

  create(data: CreateUserDto) {
    return this.prisma.user.create({ data });
  }

  findAll() {
    return this.prisma.user.findMany({ include: { cards: true } });
  }

  findOne(id: string) {
    return this.prisma.user.findUnique({
      where: { id },
      include: { cards: true },
    });
  }
}
