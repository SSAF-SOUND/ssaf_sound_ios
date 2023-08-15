//
//  SSAFSoundAPI.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import Foundation

public enum SSAFSoundAPI {
    public static let baseURL = Config.Release ? String("http://13.124.141.131:8080/") : String("http://54.180.24.11:8080")

    public static let recruits = String("recruits")
    public static let boards = String("boards")
    public static let posts = String("posts")
}
