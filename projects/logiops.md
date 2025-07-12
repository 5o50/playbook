devices: (
{
    name: "MX Master 3S";
    
    // SmartShift configuration for optimal scrolling
    smartshift: {
        on: true;
        threshold: 15;        // Lower threshold for easier free-spin activation
        torque: 50;           // Balanced resistance
    };
    
    // High-resolution scroll settings
    hiresscroll: {
        hires: true;          // Enable high-resolution scrolling
        invert: false;        // Natural scroll direction
        target: false;        // System-wide scrolling
    };
    
    // Optimized DPI for productivity
    dpi: 1200;               // Good balance for 4K and 1080p displays

    buttons: (
        // ==============================================
        // THUMB GESTURE BUTTON (0xc3): Advanced Navigation
        // ==============================================
        {
            cid: 0xc3;
            action = {
                type: "Gestures";
                gestures: (
                    // RIGHT: Next workspace/virtual desktop
                    {
                        direction: "Right";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTCTRL", "KEY_LEFTALT", "KEY_RIGHT"];
                        };
                    },
                    // LEFT: Previous workspace/virtual desktop
                    {
                        direction: "Left";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTCTRL", "KEY_LEFTALT", "KEY_LEFT"];
                        };
                    },
                    // UP: Activities overview (show all windows)
                    {
                        direction: "Up";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTMETA"];
                        };
                    },
                    // DOWN: Show applications grid
                    {
                        direction: "Down";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTMETA", "KEY_A"];
                        };
                    },
                    // CLICK (no gesture): Window switcher (Alt+Tab)
                    {
                        direction: "None";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTALT", "KEY_TAB"];
                        };
                    }
                );
            };
        },

        // ==============================================
        // FORWARD BUTTON (0x56): Browser & Media Controls
        // ==============================================
        {
            cid: 0x56;
            action = {
                type: "Gestures";
                gestures: (
                    // CLICK: Browser forward / Media next track
                    {
                        direction: "None";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTALT", "KEY_RIGHT"];
                        };
                    },
                    // UP: Volume up
                    {
                        direction: "Up";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_VOLUMEUP"];
                        };
                    },
                    // DOWN: Volume down
                    {
                        direction: "Down";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_VOLUMEDOWN"];
                        };
                    },
                    // RIGHT: Next track
                    {
                        direction: "Right";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_NEXTSONG"];
                        };
                    },
                    // LEFT: Previous track
                    {
                        direction: "Left";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_PREVIOUSSONG"];
                        };
                    }
                );
            };
        },

        // ==============================================
        // BACK BUTTON (0x53): Browser & Window Management
        // ==============================================
        {
            cid: 0x53;
            action = {
                type: "Gestures";
                gestures: (
                    // CLICK: Browser back
                    {
                        direction: "None";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTALT", "KEY_LEFT"];
                        };
                    },
                    // UP: Maximize window
                    {
                        direction: "Up";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTMETA", "KEY_UP"];
                        };
                    },
                    // DOWN: Minimize window
                    {
                        direction: "Down";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTMETA", "KEY_H"];
                        };
                    },
                    // RIGHT: Snap window to right half
                    {
                        direction: "Right";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTMETA", "KEY_RIGHT"];
                        };
                    },
                    // LEFT: Snap window to left half
                    {
                        direction: "Left";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTMETA", "KEY_LEFT"];
                        };
                    }
                );
            };
        },

        // ==============================================
        // SCROLL WHEEL BUTTON (0x52): Development & Productivity
        // ==============================================
        {
            cid: 0x52;
            action = {
                type: "Gestures";
                gestures: (
                    // CLICK: Middle click (open links in new tab, close tabs)
                    {
                        direction: "None";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["BTN_MIDDLE"];
                        };
                    },
                    // UP: New tab
                    {
                        direction: "Up";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTCTRL", "KEY_T"];
                        };
                    },
                    // DOWN: Close tab
                    {
                        direction: "Down";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTCTRL", "KEY_W"];
                        };
                    },
                    // RIGHT: Switch to next tab
                    {
                        direction: "Right";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTCTRL", "KEY_TAB"];
                        };
                    },
                    // LEFT: Switch to previous tab
                    {
                        direction: "Left";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTCTRL", "KEY_LEFTSHIFT", "KEY_TAB"];
                        };
                    }
                );
            };
        },

        // ==============================================
        // MODE SHIFT BUTTON (0xc4): Advanced Productivity
        // ==============================================
        {
            cid: 0xc4;
            action = {
                type: "Gestures";
                gestures: (
                    // CLICK: Toggle SmartShift
                    {
                        direction: "None";
                        mode: "OnRelease";
                        action = {
                            type: "ToggleSmartShift";
                        };
                    },
                    // UP: Screenshot area selection
                    {
                        direction: "Up";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_LEFTSHIFT", "KEY_LEFTMETA", "KEY_S"];
                        };
                    },
                    // DOWN: Full screenshot
                    {
                        direction: "Down";
                        mode: "OnRelease";
                        action = {
                            type: "Keypress";
                            keys: ["KEY_PRINT"];
                        };
                    },
                    // RIGHT: Increase DPI
                    {
                        direction: "Right";
                        mode: "OnRelease";
                        action = {
                            type: "ChangeDPI";
                            inc: 400;
                        };
                    },
                    // LEFT: Decrease DPI
                    {
                        direction: "Left";
                        mode: "OnRelease";
                        action = {
                            type: "ChangeDPI";
                            inc: -400;
                        };
                    }
                );
            };
        }
    );
}
);

// INSTALLATION
// sudo apt install logiops
// sudo logid --verbose

// ==============================================
// MOUSE CAPABILITIES (MX Master 3S on /dev/hidraw0:255)
// ==============================================
// 
// CID Reference: https://github.com/PixlOne/logiops/wiki/CIDs
//
// **Detected Button Capabilities:**
// CID  | reprog? | fn key? | mouse key? | gesture support?
// 0x50 |         |         | YES        |                    (Left Click)
// 0x51 |         |         | YES        |                    (Right Click)  
// 0x52 | YES     |         | YES        | YES                (Scroll Wheel/Middle Click)
// 0x53 | YES     |         | YES        | YES                (Back Button)
// 0x56 | YES     |         | YES        | YES                (Forward Button)
// 0xc3 | YES     |         | YES        | YES                (Thumb Gesture Button)
// 0xc4 | YES     |         | YES        | YES                (Mode Shift Button)
// 0xd7 | YES     |         |            | YES                (Switch Receivers Button)
//
// **Thumb Wheel Capabilities (0x2150):**
// - Timestamp: YES
// - Touch: YES  
// - Proximity: YES
// - Single tap: YES
// - Resolution: native (18), diverted (120)
//
// ==============================================
// CONFIGURATION NOTES:
// ==============================================
// 
// This configuration is tailored specifically for your MX Master 3S hardware
// based on the actual button capabilities detected by logid.
//
// **Available & Configured Buttons:**
// - 0x50 (Left Click): Standard left click - no gestures (hardware limitation)
// - 0x51 (Right Click): Standard right click - no gestures (hardware limitation)  
// - 0x52 (Scroll Wheel): Tab management and middle-click functions
// - 0x53 (Back Button): Window management and browser back navigation
// - 0x56 (Forward Button): Browser navigation and media controls
// - 0xc3 (Thumb Gesture): Workspace navigation and window switching
// - 0xc4 (Mode Shift): Screenshots, DPI adjustment, SmartShift toggle
// - 0xd7 (Switch Receivers): NOT CONFIGURED - located under mouse (impractical)
// - 0x2150 (Thumb Wheel): Available but not configured (advanced feature)
//
// **Key Productivity Features:**
// 1. **Workspace Navigation**: Seamless virtual desktop switching
// 2. **Window Management**: Snap, minimize, maximize with gestures
// 3. **Browser Productivity**: Tab management and navigation
// 4. **Media Controls**: Volume and track control
// 5. **Screenshot Tools**: Area selection and full screen capture
// 6. **Advanced Gestures**: Multi-directional button actions
//
// **Usage Tips:**
// - Use thumb button (0xc3) for workspace navigation
// - Forward/back buttons (0x56/0x53) for browser and media
// - Scroll wheel button (0x52) for tab management
// - Mode shift button (0xc4) for screenshots and settings
//
// **To apply this configuration:**
// 1. sudo cp /home/mars/Desktop/logid.cfg /etc/logid.cfg
// 2. sudo systemctl restart logid
// 3. sudo systemctl status logid
//
// **Note:** Thumb wheel (0x2150) is detected but not configured
// as it requires advanced logiops features that may not be stable.
// The current configuration focuses on reliable, tested features.
//
// ==============================================
