import { ApiProperty } from '@nestjs/swagger';
import { IsNotEmpty, IsOptional, IsUUID } from 'class-validator';

export class CreateCardDto {
  @ApiProperty({
    example: 'Charizard',
    description: 'Name of the card',
  })
  @IsNotEmpty()
  name: string;

  @ApiProperty({
    example: 'Rare',
    description: 'Card rarity (e.g. Common, Uncommon, Rare)',
  })
  @IsNotEmpty()
  rarity: string;

  @ApiProperty({
    example: '5faedc5b-91c7-4a7c-9c1d-bc1c7c5e9fa1',
    description: 'Optional user ID to assign the card to',
    required: false,
  })
  @IsOptional()
  @IsUUID()
  ownerId?: string;
}
