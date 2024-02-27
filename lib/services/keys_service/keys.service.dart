class KeysService {
  static String? getSupabaseURL()
    => const String.fromEnvironment('SUPABASE_URL');
    
  static String? getSupabaseClientKey()
    =>  const String.fromEnvironment('SUPABASE_CLIENT_KEY');
}