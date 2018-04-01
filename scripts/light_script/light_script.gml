//Initialise/Zero the variables used
ID1=0;ID2=0;ID3=0;ID4=0;
DIST1=50000;DIST2=500;DIST3=500;DIST4=500;max_range=50000;
light_number = 0;

//Sort the lights and keep the 4 closest(could be modified for the strongest)
if(Lights>=1)
{
	with(Light_Controller)
	{
		other.DIST = point_distance(x,y,other.x,other.y)
		if (other.DIST < other.max_range)//This "if" jumps straight to the end
		{
			other.Done=0
			other.light_number = other.light_number+1
			if (other.DIST < other.DIST1)
			{
				other.DIST4=other.DIST3 ; other.ID4=other.ID3
				other.DIST3=other.DIST2 ; other.ID3=other.ID2
				other.DIST2=other.DIST1 ; other.ID2=other.ID1
				other.DIST1=other.DIST ; other.ID1=self.id
				other.Done = 1
			}
			if (other.Done=0&&other.Lights>=2)
			{//This "if" jumps straight to the end
				if (other.DIST<other.DIST2)
				{
					other.DIST4=other.DIST3 ; other.ID4=other.ID3
					other.DIST3=other.DIST2 ; other.ID3=other.ID2
					other.DIST2=other.DIST ; other.ID2=self.id
					other.Done = 1
				}
				if (other.Done=0&&other.Lights>=3)
				{//This "if" jumps straight to the end
					if (other.DIST<other.DIST3)
					{
						other.DIST4=other.DIST3 ; other.ID4=other.ID3
						other.DIST3=other.DIST ; other.ID3=self.id
						other.Done = 1
					}
					if (other.Done=0&&other.Lights>=4)
					{//This "if" jumps straight to the end
						if (other.DIST<other.DIST4)
						{
							other.DIST4=other.DIST ; other.ID4=self.id
						}
					}
				}
			}
		}//All the "ifs" end here
	}
}
light_number=min(light_number,Lights)