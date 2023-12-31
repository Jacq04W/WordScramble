//
//  ContentView.swift
//  WordScramble
//
//  Created by Jacquese Whitson on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var maxScore = 0
    @State private var myScore = 0

    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    var body: some View {
        NavigationView {
               List {
                   Section {
                       TextField("Enter your word", text: $newWord)
                           .autocapitalization (.none)
                   }

                   Section {
                       ForEach(usedWords, id: \.self) { word in
                           HStack{
                               Image(systemName: "\(word.count).circle")
                               Text(word)
                           }
                       }
                       
                   }
                   
                   Section{
                       Text("My score: \(myScore)")
                   }
               }
            
               .navigationTitle(rootWord)
            /// this is for when u press done on keyboard
               .onSubmit {
                   addNewWord()
               }
            //
               .onAppear(perform: startGame)
               .alert(errorTitle, isPresented: $showingError) {
                   Button("OK", role: .cancel) { }
               } message: {
                   Text(errorMessage)
               }
               .toolbar{
                   ToolbarItem(placement: .automatic) {
                       Button("New Game"){
                           startGame()
                       }
                   }
               }
        }
        
    }
    
    
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 








private extension ContentView {
    // new code ⚡️
    func loadfile(){
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            // we found the file in our bundle!
            
            if let fileContents = try? String(contentsOf: fileURL) {
                // we loaded the file into a string!
            }
        }
    }
    // new code ⚡️
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // exit if the remaining string is empty
        guard answer.count > 0 else { return }

        // extra validation to come
// make th new word start at beginning of arrays so you can see it once added
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that word from '\(rootWord)'!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        guard isLong(word: answer) else {
            wordError(title: "Word too short", message: "Make the word longer gang")
            return
            
        }
        
        guard isRoot(word: answer) else {
            wordError(title: "Words match", message: " Words cant matchb gang")
            return
        }
        
        guard addScore(root: rootWord, word: answer) else {
            wordError(title: "Error", message: " CAnt add score")
            return
        }
        
        withAnimation{
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    // new code ⚡️
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")

                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"

                // If we are here everything has worked, so we can exit
                return
            }
        }

        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    // new code ⚡️
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    // new code ⚡️
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
//looping through each letter in the word and we are checkin to see if that letter is in the root word if not return an error
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }
    // new code ⚡️
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }
    // new code ⚡️
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }

    // new code ⚡️
    func isLong(word:String) -> Bool {
        guard word.count >= 3 else {
            return false
        }
    
        return true
    }
    
    // new code ⚡️
    func isRoot(word:String) -> Bool {
      let root = rootWord
        guard word != root else {
            return false
        }
        return true
    }
    // new code ⚡️
    
    
    func addScore(root: String,word:String) -> Bool{
        let max = root.count
        maxScore = max
        
        print(maxScore)
        var answer = word.count
        
       myScore += answer
        print(answer)

        return true
    }
    // new code ⚡️
    
    // new code ⚡️
    
    // new code ⚡️
    
    // new code ⚡️

    
}
