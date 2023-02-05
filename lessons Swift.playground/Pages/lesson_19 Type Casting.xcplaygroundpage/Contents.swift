import UIKit
var str = "Приведение типов"

//-------------//Определение классовой иерархии//-------------/
class Media {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Film: Media {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
class Music: Media {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
class NewClass {
}

//let mediaArray[AnyObject] любой объект
//let mediaArray[Any] любой тип данных
let mediaArray:[Media] = [
    Film.init(name: "Star Wars", director: "Rick Mortimer"),
    Music.init(name: "The Only", artist: "StaticX"),
    Film.init(name: "Oblivion", director: "John Palansky"),
    Music.init(name: "Numb", artist: "Linkin Park"),
    Film.init(name: "John Wick", director: "Erick Smith")
]
//-------------/Проверка типов/-------------//
var count = (musicCount:0, filmCount:0)
for obj in mediaArray {
    if obj is Film {
        count.filmCount += 1
    } else if obj is Music {
        count.musicCount += 1
    }
}
print("Total films count on device - \(count.filmCount) - and songs \(count.musicCount)")

//-------------/Понижающее привидение/-------------//
for value in mediaArray {
    if let musics = value as? Music {
        print("Song \(musics.name) by \(musics.artist)")
    } else if let films = value as? Film {
        print("Movie \(films.name) dir \(films.director)")
    }
}

