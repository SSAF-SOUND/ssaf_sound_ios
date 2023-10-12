//
//  SSAFSoundAPI.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import Foundation

public enum SSAFSoundAPI {

    public static let baseURL = Config.Release ? String("https://dev.ssafsound.com/") : String("https://api.ssafsound.com/")
    
    public static let recruits = String("recruits")
    public static let boards = String("boards")
    public static let posts = String("posts")
    public static let hotposts = String("posts/hot")
    public static let comments = String("comments")
    public static let lunchs = String("lunch")
}
