%module angel
%{
#include "../../Infrastructure/Camera.h"
%}

%nodefaultctor Camera;
class Camera : public Actor 
{
public:
	static Camera &GetInstance();
	
	virtual void Update(float dt);
	void Reset();

	void LockTo(Actor* locked, bool lockX=true, bool lockY=true, bool lockRotation=false);
	Actor* GetLockedActor();
	
	int GetWindowHeight() const;
	int GetWindowWidth() const;
	
	double GetViewRadius() const;
	Vector2 GetWorldMaxVertex() const;
	Vector2 GetWorldMinVertex() const;

	virtual void SetPosition(float x, float y);
	virtual void SetPosition(const Vector2 v2);

	virtual void SetPosition(float x, float y, float z);
	virtual void SetPosition(const Vector3 v3);

	void MoveTo(const Vector3 newPosition, float duration, bool smooth=false, const String& onCompletionMessage="");

	Vector2 GetPosition() const;
	float GetZ() const;

	virtual void SetRotation(float rotation);

	float GetZForViewRadius(float radius) const;
	float GetNearClipDist() const;
	float GetFarClipDist() const;

	virtual void SetZByViewRadius(float newRadius);
	virtual void SetNearClipDist(float dist);
	virtual void SetFarClipDist(float dist);
	
	virtual void SetViewCenter(float x, float y, float z);
	virtual void SetViewCenter(const Vector3 view);
	virtual const Vector3& GetViewCenter();

	virtual String GetClassName() const;
};
