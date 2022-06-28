//
//  ListView.swift
//  weekleat
//
//  Created by Philipp Jenny on 11.05.22.
//

import SwiftUI

struct WeekPlanner: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.title)]) var recipies: FetchedResults<Recipie>
    
    
    @State var showSheet: Bool = false
    @State var selected: Rezept = Rezepte.dummyRezepte[0]
    
    @State var generatedRecipies: [Recipie] = []
    
    var body: some View {
        NavigationView{
            
            VStack{
                List{
                    if generatedRecipies.count >= 7 {
                        if generatedRecipies != []{
                            Section(header: Text("Montag")){
                                ListItemElement(titleText: generatedRecipies[0].wrappedTitle , titleImage: generatedRecipies[0].wrappedFoodType, color: intToColorTheme(colorInt: Int(generatedRecipies[0].colorTheme)), tags: [.Veggi, .Schnell], backgroundColor: "PureWhite", portion: Int(generatedRecipies[0].portion))
                            }
                          
                            .swipeActions{
                                Button{
                                    print("New Item")
                                } label: {
                                    Label("", systemImage: "arrow.triangle.2.circlepath")
                                }
                                .tint(Color("BlueMedium"))
                            }
                        }
                        
                        if generatedRecipies != []{
                            Section(header: Text("Dienstag")){
                                ListItemElement(titleText: generatedRecipies[1].wrappedTitle , titleImage: generatedRecipies[1].wrappedFoodType, color: intToColorTheme(colorInt: Int(generatedRecipies[1].colorTheme)), tags: [.Veggi, .Schnell], backgroundColor: "PureWhite", portion: Int(generatedRecipies[1].portion))
                            }
                            .swipeActions{
                                Button{
                                    print("New Item")
                                } label: {
                                    Label("", systemImage: "arrow.triangle.2.circlepath")
                                }
                                .tint(Color("BlueMedium"))
                            }
                        }
                        
                        if generatedRecipies != []{
                            Section(header: Text("Mittwoch")){
                                ListItemElement(titleText: generatedRecipies[2].wrappedTitle , titleImage: generatedRecipies[2].wrappedFoodType, color: intToColorTheme(colorInt: Int(generatedRecipies[2].colorTheme)), tags: [.Veggi, .Schnell], backgroundColor: "PureWhite", portion: Int(generatedRecipies[2].portion))
                            }
                            .swipeActions{
                                Button{
                                    print("New Item")
                                } label: {
                                    Label("", systemImage: "arrow.triangle.2.circlepath")
                                }
                                .tint(Color("BlueMedium"))
                            }
                        }
                        
                        if generatedRecipies != []{
                            Section(header: Text("Donnerstag")){
                                ListItemElement(titleText: generatedRecipies[3].wrappedTitle , titleImage: generatedRecipies[3].wrappedFoodType, color: intToColorTheme(colorInt: Int(generatedRecipies[3].colorTheme)), tags: [.Veggi, .Schnell], backgroundColor: "PureWhite", portion: Int(generatedRecipies[3].portion))
                            }
                            .swipeActions{
                                Button{
                                    print("New Item")
                                } label: {
                                    Label("", systemImage: "arrow.triangle.2.circlepath")
                                }
                                .tint(Color("BlueMedium"))
                            }
                        }
                        
                        if generatedRecipies != []{
                            Section(header: Text("Freitag")){
                                ListItemElement(titleText: generatedRecipies[4].wrappedTitle , titleImage: generatedRecipies[4].wrappedFoodType, color: intToColorTheme(colorInt: Int(generatedRecipies[4].colorTheme)), tags: [.Veggi, .Schnell], backgroundColor: "PureWhite", portion: Int(generatedRecipies[4].portion))
                            }
                            .swipeActions{
                                Button{
                                    print("New Item")
                                } label: {
                                    Label("", systemImage: "arrow.triangle.2.circlepath")
                                }
                                .tint(Color("BlueMedium"))
                            }
                        }
                        
                        if generatedRecipies != []{
                            Section(header: Text("Samstag")){
                                ListItemElement(titleText: generatedRecipies[5].wrappedTitle , titleImage: generatedRecipies[5].wrappedFoodType, color: intToColorTheme(colorInt: Int(generatedRecipies[5].colorTheme)), tags: [.Veggi, .Schnell], backgroundColor: "PureWhite", portion: Int(generatedRecipies[5].portion))
                            }
                            .swipeActions{
                                Button{
                                    print("New Item")
                                } label: {
                                    Label("", systemImage: "arrow.triangle.2.circlepath")
                                }
                                .tint(Color("BlueMedium"))
                            }
                        }
                        if generatedRecipies != []{
                            Section(header: Text("Sonntag")){
                                ListItemElement(titleText: generatedRecipies[6].wrappedTitle , titleImage: generatedRecipies[6].wrappedFoodType, color: intToColorTheme(colorInt: Int(generatedRecipies[6].colorTheme)), tags: [.Veggi, .Schnell], backgroundColor: "PureWhite", portion: Int(generatedRecipies[6].portion))
                            }
                            .swipeActions{
                                Button{
                                    print("New Item")
                                } label: {
                                    Label("", systemImage: "arrow.triangle.2.circlepath")
                                }
                                .tint(Color("BlueMedium"))
                            }
                        }
                    }
                   
                }
                .listStyle(.plain)
            }
            .navigationTitle("Wochenplan")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        generatedRecipies = []
                        
                        var pastas: [Recipie] = []
                        var pastasveg: [Recipie] = []
                        var pastasmeat: [Recipie] = []
                        
                        var rices: [Recipie] = []
                        var ricesveg: [Recipie] = []
                        var ricesmeat: [Recipie] = []
                        
                        var potatoes: [Recipie] = []
                        var potatoesveg: [Recipie] = []
                        var potatoesmeat: [Recipie] = []
                        
                        var bakings: [Recipie] = []
                        var bakingsveg: [Recipie] = []
                        var bakingsmeat: [Recipie] = []
                        
                        
                        var others: [Recipie] = []
                        var othersveg: [Recipie] = []
                        var othersmeat: [Recipie] = []
                        
                        
                        for recipie in recipies {
                            
                            let tagString = recipie.wrappedTags
                            let tagArray = tagString.components(separatedBy: ",")
                            
                            for tag in tagArray{
                                switch tag.lowercased() {
                                case "nudeln":
                                    pastas.append(recipie)
                                    
                                case "reis":
                                    rices.append(recipie)
                                    
                                case "kartoffeln":
                                    potatoes.append(recipie)
                                    
                                    
                                case "gebackenes":
                                    bakings.append(recipie)
                                    
                                default:
                                    others.append(recipie)
                                    
                                }
                            }
                        }
                        
                        var used: String = ""
                        
                        for pasta in pastas {
                            let tagString = pasta.wrappedTags
                            let tagArray = tagString.components(separatedBy: ",")
                            for tag in tagArray{
                                switch tag.lowercased(){
                                case "vegetarisch":
                                    pastasveg.append(pasta)
                                    used = pasta.wrappedTitle
                                default:
                                    if pasta.wrappedTitle != used {
                                        pastasmeat.append(pasta)
                                    }
                                }
                            }
                        }
                        
                        for rice in rices {
                            let tagString = rice.wrappedTags
                            let tagArray = tagString.components(separatedBy: ",")
                            for tag in tagArray{
                                switch tag.lowercased(){
                                case "vegetarisch":
                                    ricesveg.append(rice)
                                    used = rice.wrappedTitle
                                default:
                                    if rice.wrappedTitle != used {
                                        ricesmeat.append(rice)
                                    }
                                }
                            }
                        }
                        
                        for potatoe in potatoes {
                            let tagString = potatoe.wrappedTags
                            let tagArray = tagString.components(separatedBy: ",")
                            for tag in tagArray{
                                switch tag.lowercased(){
                                case "vegetarisch":
                                    potatoesveg.append(potatoe)
                                    used = potatoe.wrappedTitle
                                default:
                                    if potatoe.wrappedTitle != used {
                                        potatoesmeat.append(potatoe)
                                    }
                                }
                            }
                        }
                        
                        for baking in bakings {
                            let tagString = baking.wrappedTags
                            let tagArray = tagString.components(separatedBy: ",")
                            for tag in tagArray{
                                switch tag.lowercased(){
                                case "vegetarisch":
                                    bakingsveg.append(baking)
                                    used = baking.wrappedTitle
                                default:
                                    if baking.wrappedTitle != used {
                                        bakingsmeat.append(baking)
                                    }
                                }
                            }
                        }
                        
                        for other in others {
                            let tagString = other.wrappedTags
                            let tagArray = tagString.components(separatedBy: ",")
                            for tag in tagArray{
                                switch tag.lowercased(){
                                case "vegetarisch":
                                    othersveg.append(other)
                                    used = other.wrappedTitle
                                default:
                                    if other.wrappedTitle != used {
                                        othersmeat.append(other)
                                    }
                                }
                            }
                        }
                        
                        var vegs: [Recipie] = []
                        var meats: [Recipie] = []
                        
                        //adding pasta
                        for _ in 1...3{
                            if let index = pastasveg.indices.randomElement() {
                                vegs.append(pastasveg[index])
                                pastasveg.remove(at: index)
                            }
                            
                            if let index = pastasmeat.indices.randomElement() {
                                meats.append(pastasmeat[index])
                                pastasmeat.remove(at: index)
                            }
                        }
                        
                        //adding rice
                        for _ in 1...2{
                            if let index = ricesveg.indices.randomElement() {
                                vegs.append(ricesveg[index])
                                ricesveg.remove(at: index)
                            }
                            
                            if let index = ricesmeat.indices.randomElement() {
                                meats.append(ricesmeat[index])
                                ricesmeat.remove(at: index)
                            }
                        }
                        
                        //adding baking
                        for _ in 1...1{
                            if let index = bakingsveg.indices.randomElement() {
                                vegs.append(bakingsveg[index])
                                bakingsveg.remove(at: index)
                            }
                            
                            if let index = bakingsmeat.indices.randomElement() {
                                meats.append(bakingsmeat[index])
                                bakingsmeat.remove(at: index)
                            }
                        }
                        
                        //adding other
                        for _ in 1...1{
                            if let index = othersveg.indices.randomElement() {
                                vegs.append(othersveg[index])
                                othersveg.remove(at: index)
                            }
                            
                            if let index = othersmeat.indices.randomElement() {
                                meats.append(othersmeat[index])
                                othersmeat.remove(at: index)
                            }
                        }
                        
                        //FINAL
                        
                        for _ in 1...4{
                            if let index = vegs.indices.randomElement() {
                                generatedRecipies.append(vegs[index])
                                
                                vegs.remove(at: index)
                            }
                        }
                        
                        for _ in 1...3{
                            if let index = meats.indices.randomElement() {
                                generatedRecipies.append(meats[index])
                                
                                meats.remove(at: index)
                            }
                        }
                        
                        generatedRecipies = generatedRecipies.shuffled()
                        
                        
                        //                        for gereratedRecipie in gereratedRecipies {
                        //                            print("ERGEBNIS:\(gereratedRecipie.wrappedTitle)")
                        //                        }
                        //                        print("________")
                        
                        
                        
                    } label: {
                        Label("Neu generieren", systemImage: "arrow.triangle.2.circlepath")
                    }
                }
            }
            .sheet(isPresented: $showSheet, content: {
                RezeptDetailView(rezeptDetails: selected)
            })
            
            
            
            
            
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        WeekPlanner()
        
    }
}
