//TBCTE IGT tracker and autosplitter
// Tracks in game speedrun timer, auto starts, auto resets

state("Turnip Boy Commits Tax Evasion")
{
    float time     : "UnityPlayer.dll", 0x01808468, 0x8, 0x0, 0xB8, 0x80, 0xE0;
    string150 saveManager : "UnityPlayer.dll", 0x0181B870, 0x8, 0x0;
}

startup
  {
		if (timer.CurrentTimingMethod == TimingMethod.RealTime)
// Asks user to change to game time if LiveSplit is currently set to Real Time.
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Turnip Boy",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
}

start
{
    return (current.time > 0 && old.time == 0);
}

reset
{
    return current.time < old.time;
}

update
{
//DEBUG CODE
//   print(current.saveManager.ToString());
}

split
{
    return 
    (current.saveManager.Contains("watering_picked_up")) && (!old.saveManager.Contains("watering_picked_up")) ||
    (current.saveManager.Contains("sword_picked_up")) && (!old.saveManager.Contains("sword_picked_up")) ||
    (current.saveManager.Contains("sub_picked_up")) && (!old.saveManager.Contains("sub_picked_up")) ||
    (current.saveManager.Contains("boots_picked_up")) && (!old.saveManager.Contains("boots_picked_up")) ||
    (current.saveManager.Contains("fertilizer_picked_up")) && (!old.saveManager.Contains("fertilizer_picked_up")) ||
    (current.saveManager.Contains("carrot_picked_up")) && (!old.saveManager.Contains("carrot_picked_up")) ||
    (current.saveManager.Contains("stool_picked_up")) && (!old.saveManager.Contains("stool_picked_up")) ||
    (current.saveManager.Contains("mask_picked_up")) && (!old.saveManager.Contains("mask_picked_up")) ||
    (current.saveManager.Contains("bandage_picked_up")) && (!old.saveManager.Contains("bandage_picked_up")) ||
    (current.saveManager.Contains("medicine_picked_up")) && (!old.saveManager.Contains("medicine_picked_up")) ||
    (current.saveManager.Contains("mittens_picked_up")) && (!old.saveManager.Contains("mittens_picked_up")) ||
    (current.saveManager.Contains("cherry_picked_up")) && (!old.saveManager.Contains("cherry_picked_up")) ||
    (current.saveManager.Contains("fork_picked_up")) && (!old.saveManager.Contains("fork_picked_up")) ||
    (current.saveManager.Contains("doodle_picked_up")) && (!old.saveManager.Contains("doodle_picked_up")) ||
    (current.saveManager.Contains("petalportal_picked_up")) && (!old.saveManager.Contains("petalportal_picked_up")) ||
    (current.saveManager.Contains("turnip_picked_up")) && (!old.saveManager.Contains("turnip_picked_up")) ||
    (current.saveManager.Contains("goop_picked_up")) && (!old.saveManager.Contains("goop_picked_up")) ||
    (current.saveManager.Contains("shovel_picked_up")) && (!old.saveManager.Contains("shovel_picked_up")) ||
    (current.saveManager.Contains("hazmat_picked_up")) && (!old.saveManager.Contains("hazmat_picked_up")) ||
    (current.saveManager.Contains("laser_picked_up")) && (!old.saveManager.Contains("laser_picked_up"));
}

isLoading
{
    return true;
}

gameTime
{
    return TimeSpan.FromSeconds(current.time);
}