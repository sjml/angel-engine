%module angel
%{
#include "../../Infrastructure/World.h"
%}

%nodefaultctor World;
class World 
{
public:
	static World &GetInstance();
	
	std::vector<Vec3ui> GetVideoModes() const;

	void AdjustWindow(int windowWidth, int windowHeight, const String& windowName);
	void MoveWindow(int xPosition, int yPosition);

	void ResetWorld();
	void StopGame();
	
	float GetDT() const;
	float GetCurrentTimeSeconds() const;
	float GetTimeSinceSeconds( float lastTime) const;
	
	void SetBackgroundColor(const Color bgColor);

	bool IsHighResScreen() const;
	bool IsAntiAliased() const;
	
	%apply SWIGTYPE *DISOWN {Renderable *newElement};
	void Add(Renderable *newElement, int layer = 0);
	void Add(Renderable *newElement, const String& layer);
	%clear Renderable *newElement;
	
	void Remove(Renderable *oldElement);

	void UpdateLayer(Renderable* element, int newLayer);
	void UpdateLayer(Renderable* element, const String& newLayer);

	void NameLayer(const String& name, int number);
	int GetLayerByName(const String& name);
	
	void DrawDebugLine( const Vector2 a, const Vector2 b, float time = 5.f, const Color color = Color(1.f, 0.f, 0.f) );
	void PurgeDebugDrawing();

	bool PauseSimulation();
	bool ResumeSimulation();
	bool IsSimulationOn() const;
	
	bool SetupPhysics(const Vector2 gravity = Vector2(0, -10), const Vector2 maxVertex = Vector2(100.0f, 100.0f), const Vector2 minVertex = Vector2(-100.0f, -100.0f));

	bool IsPhysicsSetUp() const;
	bool PausePhysics();
	bool ResumePhysics();
	
	void RegisterConsole(Console* console);
	Console* GetConsole();
};
