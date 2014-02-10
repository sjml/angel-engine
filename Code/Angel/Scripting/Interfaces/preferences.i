%module angel
%{
#include "../../Infrastructure/Preferences.h"
%}

%nodefaultctor Preferences;
class Preferences
{
public:
	static Preferences& GetInstance();

	void SavePreferences();
	
	int GetInt	(const String& category, const String& name) const;
	float GetFloat	(const String& category, const String& name) const;
	String GetString(const String& category, const String& name) const;
	
	void SetInt	(const String& category, const String& name, int val);
	void SetFloat	(const String& category, const String& name, float val);
	void SetString	(const String& category, const String& name, const String& val);

	int OverrideInt		(const String& category, const String& name, int val) const;
	float OverrideFloat	(const String& category, const String& name, float val) const;
	String OverrideString	(const String& category, const String& name, const String& val) const;

	String GetDefaultPath();
	String GetUserPrefsPath();
};
