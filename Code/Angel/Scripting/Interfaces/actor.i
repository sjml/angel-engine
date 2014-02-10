%module angel
%{
#include "../../Actors/Actor.h"
#include "../../Infrastructure/TagCollection.h"
%}

typedef std::set<Actor*>	ActorSet;
typedef std::vector<Actor*>	ActorList;

#ifdef SWIGLUA
%typemap(out) std::vector<Actor*>
%{
	{
		lua_newtable(L);
		if ($1.size() > 0)
		{
			for (unsigned int i=0; i <= ($1).size(); i++)
			{
				lua_pushnumber(L, i);
				SWIG_NewPointerObj(L, $i.at(i-1), SWIGTYPE_p_Actor, 0);
				lua_settable(L, -3);
			}
		}
	
		SWIG_arg += 1; 
	}
%}

%typemap(out) std::set<Actor*>
%{
	{
		lua_newtable(L);
		std::set<Actor*>::iterator it = $1.begin();
		int setCounter = 1;
		while (it != $1.end())
		{
			lua_pushnumber(L, setCounter++);
			SWIG_NewPointerObj(L, (*it), SWIGTYPE_p_Actor, 0);
			lua_settable(L, -3);
		
			it++;
		}
	
		SWIG_arg += 1;
	}
%}
#endif

enum spriteAnimationType
{
	SAT_None,
	SAT_Loop,
	SAT_PingPong,
	SAT_OneShot
};

enum actorDrawShape
{
	ADS_Square,
	ADS_Circle
};

class Actor : public Renderable, public MessageListener 
{
public:
	Actor();
	virtual ~Actor();

	virtual void Update(float dt);
	virtual void ReceiveMessage(Message* message);
	virtual void Render();
	
	virtual void SetSize(float x, float y = -1.f);
	virtual void SetSize(const Vector2 newSize);
	const Vector2& GetSize() const;

	virtual void SetPosition(float x, float y);
	virtual void SetPosition(const Vector2 pos);
	const Vector2& GetPosition() const;

	virtual void SetRotation(float rotation);
	float GetRotation() const;

	void SetColor(float r, float g, float b, float a=1.0f);
	void SetColor(const Color color);
	const Color& GetColor();

	void SetAlpha(float newAlpha);
	float GetAlpha();

	virtual void SetDrawShape( actorDrawShape DrawShape );
	actorDrawShape GetDrawShape() const;
	
	virtual void MoveTo(const Vector2& newPosition, float duration, bool smooth=false, const String& onCompletionMessage="");
	virtual void RotateTo(float newRotation, float duration, bool smooth=false, const String& onCompletionMessage="");
	virtual void ChangeColorTo(const Color& newColor, float duration, bool smooth=false, const String& onCompletionMessage="");
	virtual void ChangeSizeTo(const Vector2& newSize, float duration, bool smooth=false, const String& onCompletionMessage="");
	virtual void ChangeSizeTo(float newSize, float duration, bool smooth=false, const String& onCompletionMessage="");
	
	int GetSpriteTexture(int frame = 0) const;
	
	bool SetSprite(const String& filename, int frame = 0, GLint clampmode = GL_CLAMP, GLint filtermode = GL_LINEAR, bool optional=0);
	void ClearSpriteInfo();
	void LoadSpriteFrames(const String& firstFilename, GLint clampmode = GL_CLAMP, GLint filtermode = GL_LINEAR);
	void PlaySpriteAnimation(float delay, spriteAnimationType animType = SAT_Loop, int startFrame = -1, int endFrame = -1, const char* _animName = NULL);
 
	void SetSpriteFrame(int frame);
	int GetSpriteFrame() const;

	bool IsSpriteAnimPlaying() const;
	virtual void AnimCallback(String animName);

	void SetUVs(const Vector2 upright, const Vector2 lowleft);
	void GetUVs(Vector2 &upright, Vector2 &lowleft) const;
	
	bool IsTagged(const String& tag) const;
	void Tag(const String& newTag);
	void Untag(const String& oldTag);
	const StringSet& GetTags() const;
	
	const String& SetName(String newName);
	const String& GetName() const;
	static Actor* GetNamed(const String& nameLookup);

	virtual void LevelUnloaded();
	
	void SetLayer(int layerIndex);
	void SetLayer(const String& layerName);
	
	Actor* GetSelf();
	virtual String GetClassName() const;
	
	%apply SWIGTYPE *DISOWN {Actor* a};
	static void SetScriptCreatedActor(Actor* a);
	%clear Actor* a;
};




%nodefaultctor TagCollection;
class TagCollection
{
public:
	static TagCollection& GetInstance();
	ActorSet GetObjectsTagged(String findTag);
	StringSet GetTagList();
};
