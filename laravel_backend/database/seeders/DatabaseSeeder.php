<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Support\Carbon;
use Illuminate\Database\Seeder;
use App\Models\News;
use App\Models\Event;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        News::truncate();

        $newsList = [
            [
                'id' => 'NWS-001',
                'title' => 'COVER Corporation announces partnership with Tokyo Otaku Mode for hololive Meet 2023 New Merchandise',
                'content' => 'Tokyo, JAPAN — COVER Corporation (Minato-ku, Tokyo, Japan, CEO: Motoaki Tanigo) announced official partnership with Tokyo Otaku Mode Inc. for the release of new merchandise of hololive Meet 2023 Ambassadors from July 1st, 2023 (PDT). Tokyo Otaku Mode, hololive Meet 2023\'s Official Partner, will release original merchandise featuring Sakura Miko (hololive), Kureiji Ollie (hololive Indonesia), IRyS (hololive English), Yukoku Roberu (HOLOSTARS), and Regis Altare (HOLOSTARS English) who have been appointed as hololive Meet 2023 Ambassadors. Merchandise will be based on the key visual illustration by Pisuke and Ordan.',
                'category' => 'Entertainment',
                'image' => 'https://hololivepro.com/wp-content/uploads/2023/06/20230623_en_01.jpeg',
                'author' => 'Evotianus',
                'author_profile' => 'https://i.pinimg.com/564x/c9/70/82/c97082b327293164aa8d5339175fc54e.jpg',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 'NWS-002',
                'title' => 'Can Too Much Self-Awareness Be a Bad Thing?',
                'content' => 'Practicing self-awareness has become a staple part of professional and personal development. In general, it\'s considered to be a positive. When we turn our attention inward to reflect on our thoughts and actions, it helps us grow. It can change how we present ourselves to others and make observations that clue us into making more meaningful connections.However, can there be too much of a good thing? What happens when we become self-aware to the point of obsession? Do we cross the line into self-centeredness and, possibly, narcissism?',
                'category' => 'Self Improvement',
                'image' => 'https://assets.entrepreneur.com/content/3x2/2000/1684421160-GettyImages-1310938209copy.jpg?format=pjeg&auto=webp&crop=3:2,smart&width=500&height=334',
                'author' => 'Evotianus',
                'author_profile' => 'https://i.pinimg.com/564x/c9/70/82/c97082b327293164aa8d5339175fc54e.jpg',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 'NWS-003',
                'title' => 'CHAMPIONS LOS ANGELES: TICKET SALE INFORMATION',
                'content' => 'Champions is the final event of the 2023 VALORANT Champions Tour and represents the culmination of the competitive VALORANT season. Throughout the year, the top teams from around the world battled through their respective International Leagues and Regional Qualifiers to earn one of the sixteen spots at the largest international event of the year. From August 6 - 26 qualified teams will converge in Los Angeles to compete for the Champions trophy and the title of VALORANT World Champion! Champions will be the first international VALORANT in North America, two storied locations will host the event during the month of August. The Shrine Expo Hall will host the opening rounds from August 6-20, narrowing down the field of competitors from 16 to the top 4. Champions will conclude in front of the largest capacity venue in the history of VALORANT esports at the iconic Kia Forum. Across three days of competition, the tournament will narrow the remaining four teams and conclude with the Grand Final on August 26.',
                'category' => 'Gaming',
                'image' => 'https://images.contentstack.io/v3/assets/bltb730eada072bdbf4/blt9d090b931c9415bb/648cc296f71d772f7200391a/VCT23_Tickets.jpg?width=2472&height=1390',
                'author' => 'Evotianus',
                'author_profile' => 'https://i.pinimg.com/564x/c9/70/82/c97082b327293164aa8d5339175fc54e.jpg',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
            [
                'id' => 'NWS-004',
                'title' => 'Time Management Is About More Than Life Hacks',
                'content' => 'Project creep, slipping deadlines, and a to-do list that seems to get longer each day — these experiences are all too common in both life and work. With the New Year’s resolution season upon us, many people are boldly trying to fulfill goals to “manage time better,” “be more productive,” and “focus on what matters.” Development goals like these are indeed important to career success. Look no further than large-scale surveys that routinely find time management skills among the most desired workforce skills, but at the same time among the rarest skills to find. So how do we become better time managers? There is certainly no shortage of advice — books and blogs, hacks and apps, all created to boost time management with a bevy of ready-to-apply tools. Yet, the most frustrating reality for individuals trying to improve their time management is that no matter how effectively designed these tools might be, they are unlikely to work. Simply put, these tools presume a person’s underlying skill set, but the skills comprising time management precede the effectiveness of any tool or app. For example, would anyone seriously expect that purchasing a good set of knives, high-end kitchen equipment, and fresh ingredients would instantly make someone a five-star chef? Certainly not. Similarly, using a scheduling app without the prerequisite time management skills is unlikely to produce positive time management outcomes.',
                'category' => 'Time Management',
                'image' => 'https://hbr.org/resources/images/article_assets/2020/01/Jan20_29_168316119.jpg',
                'author' => 'Evotianus',
                'author_profile' => 'https://i.pinimg.com/564x/c9/70/82/c97082b327293164aa8d5339175fc54e.jpg',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];

        News::insert($newsList);


        // Seeding for Events table

        Event::truncate();

        $eventList = [
            [
                'id' => 'EVT-001',
                'title' => 'Cat Expedition Event',
                'ticket_count' => 100,
                'price' => 50000,
                'event_date' => Carbon::createFromDate(2023, 8, 16),
                'image' => 'https://images.unsplash.com/photo-1495360010541-f48722b34f7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=436&q=80',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
                // 'event_date' => Carbon::parse('11/05/2023')->timestamp,
                // 'event_date' => Carbon::createFromFormat('Y/m/d', '2023/08/16')->timestamp,
            ],
            [
                'id' => 'EVT-002',
                'title' => 'Super Car Expedition',
                'ticket_count' => 50,
                'price' => 100000,
                'event_date' => Carbon::CreateFromDate(2023, 12, 1),
                'image' => 'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ],
        ];

        Event::insert($eventList);
    }
}
