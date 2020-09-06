//
//  ContentView.swift
//  FoodDeliveryApp
//
//  Created by Jorge Eduardo Chaves Ulate on 9/5/20.
//  Copyright © 2020 Jorge Eduardo Chaves Ulate. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            ScrollView(.horizontal) {
                          HStack(spacing: 10) {
            ForEach(ProductData) { item in
                ProductCardView(product: item)
                            }
                }
            }
            .padding(15)
            .padding(.bottom, 15)
            
            Spacer()
            NearYouView()
            Spacer()
            HStack {
                 Spacer()
                Image(systemName: "house")
                    .foregroundColor(Color.white)
                    .frame(width: 44, height: 44, alignment: .center)
                    .background(Color.white.opacity(0.4))
                  .clipShape(Circle())
                 Spacer()
                 Image(systemName: "creditcard")
                .foregroundColor(Color.white)
                 Spacer()
                 Image(systemName: "cart.fill")
                .foregroundColor(Color.white)
                 Spacer()
                 Image(systemName: "person.circle")
                .foregroundColor(Color.white)
                 Spacer()
            }
            .frame(width: 374, height: 70, alignment: .center)
        .background(Color("Yellow"))
             .cornerRadius(25)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NearYouItemView: View {
    var NearYou: NearYouRow
    var body: some View {
        HStack {
            Image(NearYou.Logo)
                .resizable()
                .frame(width: 28, height: 28)
                .frame(width: 55, height: 55, alignment: .center)
                
                .background(Color.white)
                .cornerRadius(8)
                .padding()
            
            VStack(alignment: .leading) {
                Spacer()
                Text(NearYou.CommerceName)
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                Spacer()
                Text("12: 00 am - 12:00 pm")
                    .font(.system(size: 10))
                    .fontWeight(.light)
                Spacer()
                HStack {
                    Image(systemName: "star.fill")
                        .font(.system(size: 8))
                    Text(NearYou.Stars)
                        .font(.system(size: 8))
                    Spacer()
                    Image(systemName: "mappin.and.ellipse")
                        .font(.system(size: 8))
                    Text(NearYou.Distance)
                        .font(.system(size: 8))
                    Spacer()
                    
                }
                Spacer()
            }
            
            
        }
        .frame(width: 210, height: 75, alignment: .leading)
        .background(Color("LightGray"))
        .cornerRadius(10)
    }
}
struct ProductRow: Identifiable{
    var id = UUID()
    var Name: String
    var Image: String
    var Description: String
    var Value: String
}
let ProductData = [ProductRow(Name: "Pigeon Burger", Image: "burger1", Description: "American Burger with Extra Chesse", Value: "$5,99"), ProductRow(Name: "Toasty Burgers", Image: "burger2", Description: "Mexican Beef burger with chees", Value: "$7,99")]
struct NearYouRow: Identifiable{
    var id = UUID()
    var CommerceName: String
    var Logo: String
    var Stars: String
    var Distance: String
}
let NearYouData = [NearYouRow(CommerceName: "Pizza Hut", Logo: "PizzaHut", Stars: "4.8", Distance: "2.5 km"), NearYouRow(CommerceName: "Burger King", Logo: "bk", Stars: "5", Distance: "8 km"), NearYouRow(CommerceName: "Taco bell", Logo: "taco", Stars: "3.5", Distance: "5.5 km")]

struct NearYouView: View {
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Text("Near You")
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                Spacer()
                Text("View All")
                    .foregroundColor(Color("DarkGray"))
                    .font(.system(size: 14))
                    .fontWeight(.light)
            }
            .padding(.horizontal)
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(NearYouData) { item in
                        NearYouItemView(NearYou: item)
                    }
                }
                .padding(15)
                .padding(.bottom, 15)
            }
        }
    }
}

struct ProductCardView: View {
    var product: ProductRow
    var body: some View {
        VStack {
            VStack {
                Image(product.Image)
                    .resizable()
                    .frame(width: 150, height: 123, alignment: .center)
                    .shadow(color: Color("YellowShadow"), radius: 35, x: 0, y: 15)
                VStack(alignment: .leading) {
                    Text(product.Name)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                    Text(product.Description)
                        .font(.system(size: 10))
                        .fontWeight(.light)
                        .padding(.top, 10)
                    Text(product.Value)
                        .font(.system(size: 16))
                        .fontWeight(.medium)
                        .padding(.top, 15)
                }
            }
            .frame(width: 200, height: 293, alignment: .center)
            .background(Color("GrayLight"))
            .cornerRadius(15)
            HStack {
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 13))
                        .frame(width: 30, height: 30, alignment: .center)
                        
                        .background(Color("Yellow"))
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                        .offset(y: -45)
                    
                }
                .padding()
            }
        }
        
        
    }
}
