import { Body, Controller, Get, Param, Patch, Post } from '@nestjs/common';
import { ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger';
import { TradeStatus } from '@prisma/client';
import { CreateTradeDto } from './dtos/create-trade.dto';
import { TradesService } from './trades.service';

@ApiTags('trades')
@Controller('trades')
export class TradesController {
  constructor(private readonly tradesService: TradesService) {}

  @Post()
  @ApiOperation({ summary: 'Create a trade request between two users' })
  @ApiResponse({ status: 201, description: 'Trade created successfully.' })
  create(@Body() dto: CreateTradeDto) {
    return this.tradesService.create(dto);
  }

  @Get()
  @ApiOperation({ summary: 'List all trades with user and card info' })
  @ApiResponse({ status: 200, description: 'Trades fetched successfully.' })
  findAll() {
    return this.tradesService.findAll();
  }

  @Patch(':id/accept')
  @ApiOperation({ summary: 'Accept a trade' })
  @ApiResponse({ status: 200, description: 'Trade accepted.' })
  @ApiResponse({ status: 404, description: 'Trade not found.' })
  accept(@Param('id') id: string) {
    return this.tradesService.updateStatus(id, TradeStatus.ACCEPTED);
  }

  @Patch(':id/reject')
  @ApiOperation({ summary: 'Reject a trade' })
  @ApiResponse({ status: 200, description: 'Trade rejected.' })
  @ApiResponse({ status: 404, description: 'Trade not found.' })
  reject(@Param('id') id: string) {
    return this.tradesService.updateStatus(id, TradeStatus.REJECTED);
  }

  @Patch(':id/cancel')
  @ApiOperation({ summary: 'Cancel a trade' })
  @ApiResponse({ status: 200, description: 'Trade cancelled.' })
  @ApiResponse({ status: 404, description: 'Trade not found.' })
  cancel(@Param('id') id: string) {
    return this.tradesService.updateStatus(id, TradeStatus.CANCELLED);
  }
}
