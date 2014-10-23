
/*
 * MMonsterEntity
 * Created by Eqela Studio 2.0b7.4
 */

public class MonsterEntity : SEEntity
{
	SESprite monster;
	SESprite text;
	int w;
	int h;
	int mx;
	int my;
	int pX;
	int py;
	
	public void initialize(SEResourceCache rsc)
	{
		base.initialize(rsc);
		w = get_scene_width();
		h = get_scene_height();
		
		// player coordinates
		pX = MainScene.x;
		py = MainScene.y;
		
		rsc.prepare_image("mymonster", "monster", 0.1*w);
		monster = add_sprite_for_image(SEImage.for_resource("mymonster"));
		// mx = monster.get_x();
		
		monster.move(Math.random(0,w), Math.random(0,h));

		rsc.prepare_font("myfont", "verdana italic color=#9966CC", 100);
		text = add_sprite_for_text(" ", "myfont");
	}

	public void tick(TimeVal now, double delta)
	{
		//base.tick(now, delta);
		//monster.move(mx+(pX-mx)/20,my+(py-my)/20);
		mx = monster.get_x();
		my = monster.get_y();
		pX = MainScene.x;
		py = MainScene.x;
		monster.move(mx+(pX-mx)/Math.random(50,200),my+(py-my)/Math.random(50,200));

		if(mx==pX || my==py)
		{
			text.set_text("game over...");
			text.move(0.25*w, 0.40*h);
		}
	}

	public void cleanup()
	{
		base.cleanup();
	}
}
