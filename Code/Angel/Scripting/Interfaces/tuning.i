%module angel
%{
#include "../../Infrastructure/TuningVariable.h"
%}

%nodefaultctor Tuning;
class Tuning
{
public:
	static Tuning& GetInstance();
	StringSet GetVariables() const;
	
	int GetInt	(const String& name) const;
	float GetFloat	(const String& name) const;
	String GetString(const String& name) const;
	Vector2 GetVector(const String& name) const;
	
	void SetInt	(const String& name, int val);
	void SetFloat	(const String& name, float val);
	void SetString	(const String& name, const String& val);
	void SetVector	(const String& name, const Vector2& val);
	
	void AddToRuntimeTuningList(const String& varName);
	bool IsRuntimeTuned(const String& varName) const;
};
