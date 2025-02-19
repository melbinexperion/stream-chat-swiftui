//
// Copyright © 2022 Stream.io Inc. All rights reserved.
//

import StreamChat
import SwiftUI

public protocol MessageIdBuilder {
    
    /// Creates a message id for the provided message.
    func makeMessageId(for message: ChatMessage) -> String
}

public class DefaultMessageIdBuilder: MessageIdBuilder {
    
    public init() { /* Public init. */ }
    
    public func makeMessageId(for message: ChatMessage) -> String {
        var statesId = "empty"
        if message.localState != nil {
            statesId = message.uploadingStatesId
        }
        return message.baseId + statesId + message.reactionScoresId
            + message.repliesCountId + "\(message.updatedAt)" + message.pinStateId
    }
}
