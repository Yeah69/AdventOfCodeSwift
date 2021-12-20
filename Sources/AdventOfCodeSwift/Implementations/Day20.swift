class Day20 : Day {
    let label = "20"
    let input = inputDay20

    lazy var imageEnhancementAlgorithm: Set<Int> = {
        let lines = input.split(whereSeparator: \.isNewline)
        let numbers = String(lines[0]).enumerated().filter{ $0.1 == "#" }.map { $0.0 }
        return Set(numbers)
    }()

    lazy var initialImage: [[Character]] = {
        let lines = input.split(whereSeparator: \.isNewline).dropFirst(1)
        return lines.map { String($0).map{ $0 == "#" ? "1" : "0" } }
    }()

    func taskZeroLogic() -> String { 
        var currentInfiniCharacter = Character("0")
        var currentImage = initialImage

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")
        
        return String(currentImage.flatMap { $0 }.filter { $0 == "1" }.count)
    }
    func taskOneLogic() -> String { 
        var currentInfiniCharacter = Character("0")
        var currentImage = initialImage

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")

        currentImage = stride(from: -1, through: currentImage.count, by: 1)
            .map { y in 
                return stride(from: -1, through: currentImage[0].count, by: 1)
                    .map { x in 
                        var coordinates = 
                        [ (x - 1, y - 1), (x    , y - 1), (x + 1, y - 1),
                          (x - 1, y    ), (x    , y    ), (x + 1, y    ),
                          (x - 1, y + 1), (x    , y + 1), (x + 1, y + 1) ]
                        var chars = coordinates
                          .map { $0.1 < 0 || $0.0 < 0 || $0.1 >= currentImage.count || $0.0 >= currentImage[$0.1].count ? currentInfiniCharacter : currentImage[$0.1][$0.0] }
                        return imageEnhancementAlgorithm.contains(Int(String(chars), radix: 2) ?? 1000) 
                            ? Character("1") 
                            : Character("0")
                    }
            }

        currentInfiniCharacter = imageEnhancementAlgorithm.contains(Int(String(repeating: currentInfiniCharacter, count: 9), radix: 2) ?? 1000)
            ? Character("1")
            : Character("0")
        
        return String(currentImage.flatMap { $0 }.filter { $0 == "1" }.count)
    }
}