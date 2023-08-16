//
//  SSAFSoundAPI.swift
//  SSAFSound
//
//  Created by 서원지 on 2023/07/13.
//

import Foundation

public enum SSAFSoundAPI {
    public static let baseURL = Config.Release ? String("https://api.ssafsound.com/") : String("https://api.ssafsound.com/")
    
    public static let  recurits = String("recruits")
}
