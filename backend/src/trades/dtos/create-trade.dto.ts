import { ApiProperty } from '@nestjs/swagger';
import { IsUUID } from 'class-validator';

export class CreateTradeDto {
  @ApiProperty({
    example: 'uuid-of-user-a',
    description: 'ID of the user who is offering the trade',
  })
  @IsUUID()
  offeredById: string;

  @ApiProperty({
    example: 'uuid-of-user-b',
    description: 'ID of the user who is being requested to trade',
  })
  @IsUUID()
  requestedById: string;

  @ApiProperty({
    example: 'uuid-of-charizard',
    description: 'Card offered by the initiating user',
  })
  @IsUUID()
  cardOfferedId: string;

  @ApiProperty({
    example: 'uuid-of-gyarados',
    description: 'Card requested from the other user',
  })
  @IsUUID()
  cardRequestedId: string;
}
