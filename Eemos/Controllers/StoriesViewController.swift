//
//  StoriesViewController.swift
//  Eemos
//
//  Created by sailaja on 19/12/2019.
//  Copyright © 2019 MJZION Tech it Solutions. All rights reserved.
//

import UIKit

class StoriesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    let imagesArray = ["s-1","s-2","s-3","s-4","s-5"]
    
    let headingsArray = ["A Young Woman Stands Up to Achieve Her Dreams","Age is No Obstacle to Get Success If You Are Devoted to Your Work","Lost My Hard Earned Money to a Fake Beauty Institute, But Eemos Helped Me Achieve My Dream.","A Woman with No Formal Education is Now an Entrepreneur with a Vision","Always Had A Thought of Supporting My Family But How ?"]
    let paraArray = ["\n     Education is essential – there is no question about that. Most people believe – the more schooling you have received, the more successful you will be. In general, people who have received minimal education or drop out will struggle to make their career a successful journey. That’s the most common perception, at least. Siva Kala has proved that this perception is wrong and the person with a clear target and an absolute dedication can achieve anything they want in their life.\n     She was born and brought up in a middle-class family in Pileru Town, Chittoor district. Even though she was an intelligent student, her family’s poor financial condition made her stop her education at the high school level. Despite her educational qualification, she wanted to stand tall as one of the most successful women in their family. She is very much interested in making herself, others beautiful and decided to take this as her career. She thought it’s pointless in devoting herself in something which she doesn’t have a passion for. So, she decided to turn her passion into her career.\n\n   “I feel that Eemos beauty parlor course has a huge impact on my life that helped me look at things and situations in a very different manner.” – Siva Kala \n\n   “Our tutor, Mohana Lakshmi is a very good beautician with vast knowledge about beauty. She completed the CIDESCO Certification (Switzerland) & Cosmetic Formulation Course in the USA under the guidance of leading cosmetic formulator. I concentrated more on her client management skills where I struggled more. She is very genuine to clients, explains each and everything in detail from makeup to starting a beauty parlor. If you see her working in the parlor, you will see her working with absolute commitment and delicately beautifying and making her clients happy. This nature of our tutor made us aware of the importance of client management in the beauty industry.” – Siva Kala \n\n    “The happiness on my clients’ face is what motivates, satisfies and keeps me going” – Siva Kala \n\n    Soon after her training, she got placed in one of the reputed beauty parlors in Tirupati. Her training has helped her become so proficient that she began to get appreciation from day 1. She was very happy with the work, upskilling programs and recognition she got at the beauty parlor. As they said the days are not going to be the same forever, she couldn’t be happy when there were problems at home. She had to leave the job and take care of the family.\n\n   She felt that my dream of pursuing my career in the beauty industry got shattered. Not being the one to give up, she came back and raised above all the problems. She thought it would be helpful for the family if she earns money, moreover, it’s my passion to work in the beauty industry. Her family too agreed with her idea. This made her determined and work even more towards her dream of starting a beauty parlor in Tirupati, however, it took 6 long years with absolute dedication. With this, she completely entered into the world of entrepreneurship. But, she hasn’t been a successful entrepreneur always. Just like many other entrepreneurs, she also failed many times before finding success.\n\n  “My passion for beauty, making others beautiful and the scope of making a career and earning money helped me become what I am today.” – Siva Kala\n\n    Presently, she is running a medium-sized beauty parlor in Tirupati, taking care of her professional and family life very well. Her parents are pleased too. She is looking forward to learning more and developing her parlor like a brand.\n\n    “Obstacles come up in life, but I always face them as challenges with my passion for what I am doing. I believe that I can’t fail if I never stop trying.” – Siva Kala","  My name is Saroopa. I am a typical Indian woman, born and brought up in Tirupati. Being born in a middle class, I couldn’t get any of formal education. I was made to learn tailoring work to give helping hand to my family financially. It was not my passion, but I had no other choice. I always wanted to do what makes feel happy at the end of the day. Being a girl with no formal education, I know it was hard for me to figure out my passion.\n\n    I used to look at others – what they are doing and what their passion is. But, within no time I understood we can’t find out our passion by looking at others and searching for the one. Meanwhile, I was doing tailoring works and helping out my parents to run family smoothly. I was married and got two kids.\n\n I am delighted to get trained under Mrs. Mohana Lakshmi, Founder of Eemos. She completed the CIDESCO Certification (Switzerland) & Cosmetic Formulation Course in the USA under the guidance of leading cosmetic formulator. I concentrated more on her client management skills where I struggled more. She is very genuine to clients, explains each and everything in detail from makeup to starting beauty parlor. She eliminated all my fears. \n\n    Before the completion of the course, I got the confidence that I can start my own business. I started a beauty parlor and been providing the best services. I could help my husband in providing quality education to my sons.\n\n    Now  I am also providing beauty training in Tirupati, has two employees working with me. I am very happy about what I am doing. This is all because I got the right training at Eemos at the right time. And also, I should thank my husband for supporting and having confidence in me during difficult situations.","My name is Jyothi. I have done the nursing course to make a living. I completed the nursing course because I had to. But, it was neither my interest nor passion. I am very interested in the beauty industry and wanted to become a Beauty-Prenuer. And, it is needless to say that we can’t get or become everything we wish for in life. But, I wanted to give it a try. Even if I don’t make it, I would be happy that I tried my best.\n\n I left my job to pursue my dream. But, choosing a beauty academy to join and learn the beautician course had become a big task for me. I had seen many institutes where the fee and the quality of the education they provide do not match at all. Finally, I came across an institute which I thought it would be perfect for me. I joined there for the professional beauty parlor course. The course fee was 75k. The fee was very high, but the institute had good reviews with ratings. I thought – If I get good knowledge about the course, the money won’t be an issue. I had saved a decent amount of money during my job. Moreover, I didn’t need to rely on anyone for money.\n\n The institute, their reviews, and their ratings were all fake. They told us to follow YouTube videos and learn. I don’t need to join in an institute that charges 75k for learning through YouTube (I can’t tell you the institute name because of various reasons). I could do that at home. My hard earned money went in vain. But, with the help of friends, I had practiced and learned the basics of the course. I had no money to join in another institute to learn the professional beautician course.\n\n    With the help of my friend, I started a beauty salon in Puttur. We offered the best services possible. Later, I got married and went to New Zealand with my husband. I handed over the beauty salon to my friend completely. I was happy in New Zealand, but I wanted to start my beauty parlor in Tirupati. I told my husband, and even he wanted to return to India. We returned to India. But, my husband suggested me to learn the professional beauty parlor course in a good institute in Tirupati.\n\n     I enquired and went to demo classes in many institutes in and around Tirupati. I was not satisfied with any of their teaching. I couldn’t go to a metro city and be there for 5-6 months just for the course. Of course, it is my passion, but I had my valid reasons. Then, I heard about Eemos beauty academy in Tirupati. Like before, the institute, their reviews, and ratings were good.  But, this time I went to demo classes for different courses to check their teaching and the services they are providing in their beauty parlor. I was really impressed with their teaching and services. And, I decided to join in the Eemos beauty academy without wasting my time anymore."," Name: Dakshyani, \n Parlor: Karishma Beauty Salon,\n Place: Pallipattu, Tamilnadu. \n\n     I came from a lower-middle-class family in Pallipattu, Tamilnadu. Like many girls from a lower-middle-class family, I couldn’t study for too long. But, I had learned, observing my parents, what all it takes to run a family – the absolute love with absolute determination.\n\n    I was married to my husband at an early age. We have two daughters. My husband was working hard, earning a reasonable amount of money – which is sufficient to run a family but not to provide our two daughters with the best education. I remember what happened in my case and I decided I shouldn’t let the history repeat. I always wanted to support my husband. I started tailoring at home. Being a woman with no formal education and no proper guidance, I couldn’t find any better way.\n\n    I could help my husband to some extent. I was very happy. But, within a short time, I realized we couldn’t afford a suffocated life to our daughters. I had to look for another way. That was the time I came across a beauty parlor nearby my home, owned by a woman. I got to know that she was earning 50k per month. Out of curiosity, I asked her all my doubts – how to become a beautician and what is essential to start a beauty parlor?\n\n    She explained me everything. She was not offering any beautician course in her beauty parlor but accepted to teach me the basics of the beautician course. Without thinking a thing, I joined in her beauty parlor. I learned the basics of makeup in two months which helped me run a small beauty parlor for six years in my home. To acquire the professional beauty parlor course, I wanted to join in a reputed beauty academy.\n\n    To Provide My daughters with the Best Education, I Had to Educate Myself.\n\n    On seeing my passion for becoming a beautician, my cousin’s wife recommended me Eemos beauty academy in Tirupati. She was a teacher in a private school. Because of the too much pressure and low paying salary, she had to leave the job. Later, she joined in a professional beauty course in Eemos beauty academy in Tirupati, mastered the course and been working as a beautician in Srikalahasti.\n\n    I enquired about the Eemos beauty academy, had seen their website and was impressed, decided to join the Eemos. After knowing the complete details, I decided to join in the Eemos beauty academy. Within a few days of the course, I understood it is not as easy as I think. I came to know that a beautician needs to involve one hundred percent to understand a customer’s requirement and to help them look flawlessly.\n\n    I got too many doubts which were clearly explained by our tutor, Mrs. Mohana Lakshmi. She completed the Cosmetic Formulation Course in the USA under the guidance of leading cosmetic formulator. She is very sensible and has a good taste which can make a big difference in the beauty industry. She was the one who got the burning the question in my mind, and told me – Where there’s a will there’s a way. She built confidence in me.\n\n    I heeded her advice and grasped everything that is essential to start a beauty parlor. I got an overall idea about it even before the completion of the course. After completing the course, I started a small beauty parlor and been helping my customers get their best look. My work has been receiving appreciation, recognized by our customers, and many of them recommended our beauty parlor to their relatives and friends. Now, our beauty parlor is one of the best parlors in and around pallipattu, Tamilnadu.\n\n    Now I own a beauty parlor, earning 30k per month and happily living with my family in my hometown. I am supporting my husband, and I am also planning to expand my beauty parlor. My daughters are pursuing their bachelor’s degree in a top engineering college. My dream has come true. Without the guidance that Eemos beauty academy gave me, I may not have been where I am today.","Name: Adi Lakshmi,\n Employee: VIEWS LADIES SALON, KUWAIT.\n Place: Railway Kodur, Andhra Pradesh.\n\n    As a girl from a lower middle class residing at railway kodur in Andra Pradesh, I have lot intention to earn and support my family. Now a days to achieve a good job with a 4 digit salary we need a degree at least Which I don’t possess. When I spoke to my friend and she referred EEMOS ACADEMY for beautician course Tirupati.\n\n    Yes I have more interest on beautification as a girl with her suggestion, I enquired with some other friends and felt EEMOS would be the best choice for better learning and earning in short time as beauty has the Tremendous potential down the line.\n\n  Thanks to EEMOS who trained me for perfect career.\n\n    So I opted and joined for three months Advance Beauty Course at EEMOS Academy and complete the course in November 2018. I got placed as a Beauty Therapist in the month of December 2018 itself with starting salary of 25000.00 ( INR ) per month at VIEWS LADIES SALON, KUWAIT.\n\n    Even now I can’t believe myself I would get in to a job a decent salary ASAP I finished my course in EEMOS ACADEMY. Now I am supporting my family, making them feel proud on seeing me.\n\n    Also the course has transformed me with lots of confidence to live a sophisticated life and it’s all just because of the expertise cosmetologist at EEMOS. Once again thanks for EEMOS."]
    
    @IBOutlet weak var tableview: UITableView!
    let boldParasArrays = [["“I feel that Eemos beauty parlor course has a huge impact on my life that helped me look at things and situations in a very different manner.” – Siva Kala","“The happiness on my clients’ face is what motivates, satisfies and keeps me going” – Siva Kala","“My passion for beauty, making others beautiful and the scope of making a career and earning money helped me become what I am today.” – Siva Kala","“Obstacles come up in life, but I always face them as challenges with my passion for what I am doing. I believe that I can’t fail if I never stop trying.” – Siva Kala"],[" Mrs. Mohana Lakshmi, Founder of Eemos"],["Beauty-Prenuer"],["To Provide My daughters with the Best Education, I Had to Educate Myself."," Eemos beauty academy in Tirupati"],["Thanks to EEMOS who trained me for perfect career."]]
    var readSelected = Set<Int>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headingsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! StoriesTableViewCell
        
        cell.readMorebtn.tag = indexPath.row
        cell.paraLabel.tag = indexPath.row
        
        
        cell.headingLable.attributedText = attributedText(indexPath: headingsArray[indexPath.row])
        cell.imageview.image = UIImage(named: imagesArray[indexPath.row])
        cell.paraLabel.attributedText = attributedText1(string: paraArray[indexPath.row], indexPath: indexPath)
        if checkReadmore(index: indexPath.row){
            cell.maintainConstrainsFalse()
        }else{
            cell.maintainConstrainsTrue()
        }
        cell.readMorebtn.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        
        return cell
    }
    // Read more button action
    @objc func buttonClicked(sender : UIButton) {
        UIView.animate(withDuration: 10.0) {
            self.tableview.reloadData()
        }
        
        print("*****************\(sender.tag)")
        updateSet(index: sender.tag)
        print(readSelected)
    }
    func checkReadmore(index:Int)->Bool{
        if readSelected.contains(index){
            return true
        }else {
            return false
        }
    }
    func updateSet(index : Int){
        if readSelected.contains(index){
            readSelected.remove(index)
        }else {
            readSelected.insert(index)
        }
    }
    var heightConstraint = NSLayoutConstraint()
    func setConstrains(lable:UILabel){
        heightConstraint = NSLayoutConstraint(item: lable, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 100)
    }
    
    func attributedText(indexPath : String) -> NSAttributedString {
        
        
        let attributedString = NSMutableAttributedString(string: indexPath , attributes: [NSAttributedString.Key.font:UIFont(name: "Palatino-Bold", size: 20)])
        
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont(name: "Palatino", size: 18)]
        let nsString = indexPath as NSString
        // Part of string to be bold
        attributedString.addAttributes(boldFontAttribute, range: nsString.range(of: indexPath))
        
        return attributedString
    }
    
    func attributedText1(string : String,indexPath : IndexPath) -> NSAttributedString {
        let style = NSMutableParagraphStyle()
        style.alignment = .left
        style.headIndent = 10
        
        
        let style1 = NSMutableParagraphStyle()
        style1.alignment = .left
        style1.headIndent = 15
        
        let attributedString = NSMutableAttributedString(string: string
            , attributes: [NSAttributedString.Key.font:UIFont(name: "Palatino", size: 18),NSAttributedString.Key.paragraphStyle :style])
        
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont(name: "Palatino-Bold", size: 18),NSAttributedString.Key.paragraphStyle : style1]
        
        let nsString =  string as NSString
        let parArray = boldParasArrays[indexPath.row]
        // Part of string to be bold
        for para in parArray{
            attributedString.addAttributes(boldFontAttribute as [NSAttributedString.Key : Any], range: nsString.range(of: para))
        }
        
        
        return attributedString
    }
    
}
