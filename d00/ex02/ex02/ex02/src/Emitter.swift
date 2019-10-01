//
//  Emitter.swift
//  ex02
//
//  Created by Ivan Kozlov on 9/30/19.
//  Copyright © 2019 Ivan Kozlov. All rights reserved.
//

import UIKit

class EmitterFactory {
    static func getEmitter(with image: UIImage, x: CGFloat, y: CGFloat) -> CAEmitterLayer {
        let emitter = CAEmitterLayer()
        emitter.emitterShape = kCAEmitterLayerLine
        emitter.emitterPosition = CGPoint(x: x, y: y)
        emitter.emitterSize = CGSize(width: 2, height: 2)
        emitter.emitterCells = generateEmitterCells(with: image)
        return emitter
    }
    
    static func generateEmitterCells(with image: UIImage) -> [CAEmitterCell] {
        var cells = [CAEmitterCell]()
        
        let cell = CAEmitterCell()
        cell.contents = image.cgImage
        cell.birthRate = 10
        cell.lifetime = 15
        cell.velocity = CGFloat(80)
        cell.emissionLatitude = CGFloat(45)
        cell.emissionRange = CGFloat(360)
        cell.scale = 0.4
        cells.append(cell)
        return cells
    }
}
