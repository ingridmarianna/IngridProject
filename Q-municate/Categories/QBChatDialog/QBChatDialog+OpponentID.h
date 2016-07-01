//
//  QBChatDialog+OpponentID.h

//
//  Created by Hideki on 5/25/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

@interface QBChatDialog (OpponentID)

/**
 *  Opponent ID for private chat dialog.
 *
 *  @return opponent ID for private chat dialog,
 *  NSNotFound if dialog is not private or does not have any opponents
 */
- (NSUInteger)opponentID;

@end
