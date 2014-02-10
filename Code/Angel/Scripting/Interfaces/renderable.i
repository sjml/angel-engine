%module angel
%{
#include "../../Infrastructure/Renderable.h"
%}

%nodefaultctor Renderable;
class Renderable
{
public:
	Renderable();
	virtual ~Renderable();

	virtual void Update(float dt);
	virtual void Render();

	void Destroy();
	bool IsDestroyed() const;
	int GetLayer() const;
};
