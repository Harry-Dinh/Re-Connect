//
//  PostView.swift
//  iConnect_iOS2
//
//  Created by Harry Dinh on 2021-05-10.
//

import SwiftUI

struct PostView: View {
    
    @ObservedObject var postVM = PostVM.shared
    
    var body: some View {
        GroupBox {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 45, height: 45)
                    
                    VStack(alignment: .leading) {
                        Text("Harry Dinh")
                            .font(.headline)
                        Text("Posted on June 14, 2021 at 14:15")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "ellipsis.circle")
                            .imageScale(.large)
                            .foregroundColor(.primary)
                    })
                }
                
                Divider()
                
                Text("Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum[d] exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? [D]Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur? [33] At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.")
                    .lineLimit(5)
                    .font(.subheadline)
                
                Divider()
                
                HStack(alignment: .center) {
                    
                    Button(action: {}, label: {
                        Image(systemName: "heart")
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "hand.thumbsdown")
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "text.bubble")
                    })
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "square.and.arrow.up")
                    })
                }
                .imageScale(.large)
                .foregroundColor(.primary)
                .padding(.horizontal)
            }
        }
        .cornerRadius(25)
    }
}

struct PreviewPost: View {
    @ObservedObject var postVM = PostVM.shared
    
    var body: some View {
        ZStack {
            BlurView()
                .ignoresSafeArea()
            
            GroupBox {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 45, height: 45)
                        
                        VStack(alignment: .leading) {
                            Text("Harry Dinh")
                                .font(.headline)
                            Text("Posted on \(NewPostVM.shared.dateFormatter.string(from: Date()))")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            NewPostVM.shared.isPreviewing = false
                        }, label: {
                            Image(systemName: "eye.slash")
                                .imageScale(.large)
                                .foregroundColor(.red)
                        })
                    }
                    
                    Divider()
                    
                    Text("Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt")
                        .lineLimit(5)
                        .font(.subheadline)
                    
                    Divider()
                    
                    HStack(alignment: .center) {
                        Image(systemName: "heart")
                        Spacer()
                        Image(systemName: "hand.thumbsdown")
                        Spacer()
                        Image(systemName: "text.bubble")
                        Spacer()
                        Image(systemName: "square.and.arrow.up")
                    }
                    .imageScale(.large)
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                }
            }
            .cornerRadius(25)
            .shadow(color: .secondary, radius: 5, x: 0, y: 5)
            .padding()
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PostView()
            PreviewPost()
        }
    }
}
