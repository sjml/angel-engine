%module angel
%{
#include "../../Actors/ParticleActor.h"
%}

class ParticleActor : public Actor
{
public:
	ParticleActor();
	~ParticleActor();

	virtual void Update(float dt);
	virtual void Render();
	
	void SetParticlesPerSecond(float pps);
	void SetSystemLifetime(float lifetime);
	void SetParticleLifetime(float lifetime);

	void SetSpread(float radians);
	void SetEndScale(float scale);
	void SetEndColor(const Color color);
	void SetSpeedRange(float minSpeed, float maxSpeed);

	void SetMinSpeed(float minSpeed);
	void SetMaxSpeed(float maxSpeed);

	void SetGravity(const Vector2 gravity);

	void SetAttractor(const Vector2 attractor);
	void SetAttractorStrength(float strength);

	void SetMaxParticles(int maxParticles);

	virtual String GetClassName() const;
};
